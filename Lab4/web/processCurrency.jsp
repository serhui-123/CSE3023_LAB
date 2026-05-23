<%-- 
    Document   : processCurrency
    Created on : 21 Apr 2026, 1:42:53 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Basic Settings */
            body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            /* REMOVE FLEX */
            display: block;
            }
            
            .container {
            width: 100%;
            max-width: 900px;
            margin: 0 auto; /* center properly */
            }
            /* Main Title */
            h1 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 10px;
            }
            /* Form Card */
            .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            /* Form Title (Purple Heading) */
            .form-title {
            color: #6f42c1;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            font-size: 1.8rem;
            font-weight: 600;
            letter-spacing: -0.5px;
            margin-top: 0;
            margin-bottom: 25px;
            text-transform: capitalize;
            }
            /* Input & Form Group Styling */
            .form-group {
            margin-bottom: 20px;
            }
            label {
            
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
            }
            input[type="text"],
            input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            }
            /* Radio Button Styling */
            .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
            }
            .radio-label {
            font-weight: normal;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            }
            /* Button Styling */
            .button-group {
            margin-top: 30px;
            display: flex;
            gap: 10px;
            }
            .btn {
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
            }
            .btn-submit {
            background-color: #e0e0e0;
            color: #333;
            border: 1px solid #adadad;
            }
            .btn-submit:hover {
            background-color: #d0d0d0;
            }
            .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
            border: 1px solid #adadad;
            }
            .btn-cancel:hover {
            background-color: #ffcccc;
            }
            /* Dropdown Select Styling */
            select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            background-color: white;
            font-size: 1rem;
            cursor: pointer;
            }
            select:focus {
            outline: none;
            border-color: #6f42c1;
            }
            
            /* ===== RESULT PAGE STYLES (TWO-COLUMN LAYOUT) ===== */
            .result-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 25px;
            }
            .result-box {
            background: #f9f9fb;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            }
            .result-box h3 {
            margin-top: 0;
            margin-bottom: 20px;
            color: #6f42c1;
            font-size: 1.3rem;
            border-bottom: 2px solid #6f42c1;
            padding-bottom: 10px;
            }
            /* Result text styling */
            .result-group {
            margin-bottom: 15px;
            padding: 8px 0;
            border-bottom: 1px dashed #e0e0e0;
            }
            .result-group:last-child {
            border-bottom: none;
            }
            .result-group label {
            display: inline-block;
            font-weight: 600;
            color: #555;
            min-width: 140px;
            }
            
            .result-group p {
            display: inline-block;
            margin: 0;
            color: #333;
            font-weight: 500;
            }
            /* Alternative Flexbox layout for result groups */
            .result-group-flex {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            padding: 8px 0;
            border-bottom: 1px dashed #e0e0e0;
            }
            .result-group-flex label {
            font-weight: 600;
            color: #555;
            }
            .result-group-flex p {
            margin: 0;
            color: #333;
            font-weight: 500;
            }
            /* Back Button Styling (Result Page) */
            .btn-back {
            background-color: #6f42c1;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
            }
            .btn-back:hover {
            
            background-color: #5a32a3;
            }
            /* Responsive Design for Mobile */
           
            .result-grid {
            grid-template-columns: 1fr;
            gap: 15px;
            }
            .result-group label {
            display: block;
            margin-bottom: 5px;
            }
            .result-group p {
            display: block;
            margin-left: 0;
            }
            .result-group-flex {
            flex-direction: column;
            }
            .result-label {
                display: block;      /* Forces text to a new line */
                font-weight: bold;
                margin-top: 15px;
                color: #555;
            }

            .result-value {
                display: block;      /* Forces text to a new line */
                margin-bottom: 10px;
                color: #333;
                font-size: 1.1rem;
            
}
        </style>
    </head>
    <body>
     
    
    <%!
         // Define constant exchange rates
         final double USD = 0.25;
         final double EURO = 0.21;
         final double JPY = 40;
         final double SGD = 0.32;
         // Method to calculate conversion
         private double calculateRate(String currency, int amount) {
         double currencyChange = 0.0;
         if (currency != null) {
         if (currency.equals("1")) {
         currencyChange = amount * USD;
         } else if (currency.equals("2")) {
         currencyChange = amount * EURO;
         } else if (currency.equals("3")) {
         currencyChange = amount * JPY;
         }else if (currency.equals("4")) { // Change this to a specific check!
            currencyChange = amount * SGD;
        }
         }
         return currencyChange;
         }
 %>
 
 <%
       String currencyType = request.getParameter("currencyType");
       String amountRaw = request.getParameter("amount");
       int amount = 0;
       double total = 0;
       try {
       
       if (amountRaw != null) {
       amount = Integer.parseInt(amountRaw);
       total = calculateRate(currencyType, amount);
       }
       } catch (Exception e) {
       amount = 0;
       }
       // Determine currency name for display
       String currencyName = "N/A";
       if ("1".equals(currencyType)) currencyName = "USD";
       else if ("2".equals(currencyType)) currencyName = "EURO";
       else if ("3".equals(currencyType)) currencyName = "JPY";
       else if ("4".equals(currencyType)) currencyName = "SGD";
    %>
 


    <div class="card">
        <h1>JSP Application Result</h1>
        <h2 class="form-title">Conversion Result</h2>
        
        <div class="result">
        <span class="result-label">Customer Code</span>
        <span class="result-value">RM <%= amount %></span>
        <span class="result-label">Converted to (<%= currencyName %>):</span>
        <span class="result-value"><%= String.format("%.2f", total) %></span>
        
        </div>
        <br>
            <button onclick="history.back()" style="padding: 10px 20px; cursor: pointer;">Back to Converter</button>
        </div>
   

    </body>
</html>
