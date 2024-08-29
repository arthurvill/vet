<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Branch;
use Illuminate\Support\Facades\Mail;
use App\Mail\UserRegistered;
use Illuminate\Support\Facades\URL;

class AuthController extends Controller
{
    public function showRegistrationForm()
    {
        // Fetch all branches from the database
        $branches = Branch::all();

        return view('logins.register', compact('branches'));
    }

    public function register(Request $request)
    {
        Log::info('Registration process started.');

        $validatedData = $request->validate([
            'username' => 'required|string|max:50',
            'firstName' => 'required|string|max:50',
            'lastName' => 'required|string|max:50',
            'middleName' => 'nullable|string|max:50',
            'gender' => 'required|in:male,female,other',
            'age' => 'required|integer',
            'email' => 'required|email|max:50|unique:users,email', // Ensure email is unique
            'role' => 'required|in:super_admin,admin,staff,patient',
            'password' => 'required|string|max:255',
            'branch_id' => 'nullable|exists:branches,id', // Modify validation for branch_id
            'contact_number' => 'nullable|string|max:20',
            'region' => 'required|string|max:255',
            'province' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'barangay' => 'required|string|max:255',
        ]);

        // Log the validated data for debugging
        Log::info('Validated data:', $validatedData);

        // Handle conditional branch_id
        if ($request->role !== 'patient' && empty($request->branch_id)) {
            return redirect()->back()->withErrors(['branch_id' => 'The branch id field is required for non-patient roles.']);
        }

        $validatedData['password'] = bcrypt($validatedData['password']);

        $addressComponents = [
            'region' => $request->input('region_text', $validatedData['region']),
            'province' => $request->input('province_text', $validatedData['province']),
            'city' => $request->input('city_text', $validatedData['city']),
            'barangay' => $request->input('barangay_text', $validatedData['barangay']),
        ];

        $address = implode(', ', $addressComponents);
        $validatedData['address'] = $address;
        $validatedData['status'] = 'pending';

        try {
            $user = User::create($validatedData);
            Log::info('User created successfully:', ['user_id' => $user->id]);

            // Generate verification URL
            $verificationUrl = URL::temporarySignedRoute(
                'verification.verify',
                now()->addMinutes(60),
                ['id' => $user->id]
            );

            Mail::to($user->email)->send(new UserRegistered($user, $verificationUrl));
            Log::info('Verification email sent.');

            return redirect()->route('login.form')->with('success', 'Registration successful. Please check your email for verification instructions.');
        } catch (\Exception $e) {
            Log::error('User registration failed:', ['error' => $e->getMessage()]);
            return redirect()->back()->withErrors(['error' => 'Registration failed. Please try again.']);
        }
    }

    public function showLoginForm()
    {
        return view('logins.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        $user = User::where('email', $credentials['email'])->first();

        if ($user && Auth::attempt(['email' => $credentials['email'], 'password' => $credentials['password']])) {
            if ($user->status === 'verified') {
                if ($user->branch_id === auth()->user()->branch_id) {
                    switch ($user->role) {
                        case 'super_admin':
                            return redirect()->route('super_admin.dashboard');
                        case 'admin':
                            return redirect()->route('admin.home');
                        case 'staff':
                            return redirect('/staff');
                        case 'patient':
                            return redirect()->route('showDashboard');
                        default:
                            return redirect()->route('dashboard');
                    }
                } else {
                    Auth::logout();
                    return redirect()->route('login.form')->with('error', 'You do not have access to this branch.');
                }
            } else {
                Auth::logout();
                return redirect()->route('login.form')->with('error', 'Your account is not verified. Please check your email for verification instructions.');
            }
        }

        return redirect()->route('login.form')->with('error', 'Invalid credentials');
    }

    public function logout()
    {
        if (Auth::check()) {
            $user = Auth::user();
            Auth::logout();
            Session::flush();
            return redirect()->route('login.form')->with('success', "You have been logged out successfully, $user->name.");
        }

        return redirect()->route('login.form');
    }

    public function verifyEmail(Request $request, $id)
    {
        $user = User::findOrFail($id);

        if ($user->status === 'pending') {
            $user->status = 'verified';
            $user->save();

            return redirect()->route('login.form')->with('success', 'Email verification successful. You can now login.');
        }

        return redirect()->route('login.form')->with('info', 'Your email is already verified.');
    }
}
