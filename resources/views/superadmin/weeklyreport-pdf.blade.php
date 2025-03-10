<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Sales Report</title>
    <style>
        /* Your CSS styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .total-column {
            text-align: right;
            font-weight: bold;
        }
        .custom-bg-color {
            background-color: #BC7FCD;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container p-3 my-3 custom-bg-color text-white">Weekly Sales Report ({{ $startDate->format('M d, Y') }} to {{ $endDate->format('M d, Y') }})</div>
    <!-- Sales table -->
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalSales = 0;
            @endphp
            @foreach($salesWithinWeek as $sale)
            <tr>
                <td>{{ $sale->created_at->format('M d, Y') }}</td>
                <td>{{ $sale->product->name }}</td>
                <td>{{ $sale->quantity }}</td>
                <td>₱{{ number_format($sale->total_price, 2) }}</td>
            </tr>
            @php
                $totalSales += $sale->total_price;
            @endphp
            @endforeach
            <tr>
                <td class="total-column" colspan="3">Total Sales:</td>
                <td class="total-column">₱{{ number_format($totalSales, 2) }}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
