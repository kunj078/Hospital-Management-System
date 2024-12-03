<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Billing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* Light teal background */
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #00796b; /* Darker teal for the heading */
            text-align: center;
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #004d40; /* Even darker teal for labels */
        }

        .form-group input[type="number"],
        .form-group input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #b2dfdb; /* Light teal border */
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #00796b; /* Teal button */
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #004d40; /* Darker teal on hover */
        }

        .back-home {
            margin: 1.5rem;
            text-align: center;
        }

        .back-home a {
            color: #00796b; /* Teal color for the link */
            text-decoration: none; /* Remove underline */
            font-weight: bold; /* Bold text */
        }

        .back-home a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>

    <h2>Add Billing</h2>
    <div class="form-container">
        <form action="BillingServlet" method="post">
            <div class="form-group">
                <label for="patient_id">Patient ID:</label>
                <input type="number" id="patient_id" name="patient_id" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" required>
            </div>
            <div class="form-group">
                <label for="payment_date">Payment Date:</label>
                <input type="date" id="payment_date" name="payment_date" required>
            </div>
            <div class="form-group">
                <label for="payment_status">Payment Status:</label>
                <input type="text" id="payment_status" name="payment_status" required>
            </div>
            <input type="submit" value="Add Billing">
        </form>
        <div class="back-home">
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>

</body>
</html>
