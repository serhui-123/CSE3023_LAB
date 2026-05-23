<%-- 
    Document   : processCalculateCarLoan
    Created on : 14 Apr 2026, 3:25:19 pm
    Author     : 60179
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calculation Result</title>
    </head>
    <body>
        <h1>Perform Car Loan Calculation</h1>
        <fieldset>
            <h3 style="color: blue;">Details of car loan:</h3>
            <%
                // 1. Retrieve data from the form [cite: 482]
                String strAmount = request.getParameter("loan_amount");
                String strPeriod = request.getParameter("loan_period");

                // 2. Convert Strings to numbers for math [cite: 293, 308]
                double amount = Double.parseDouble(strAmount);
                int period = Integer.parseInt(strPeriod);

                // 3. Logic: Assume an interest rate (e.g., 4.5% or 0.045) [cite: 483]
                double interestRate = 0.045; 
                double totalInterest = amount * interestRate * period;
                double totalLoan = amount + totalInterest;
            %>

            <p>Loan Request : <%= amount %></p>
            <p>Period of payment : <%= period %></p>
            <p><strong>Total Loan (+ interest) : <%= totalLoan %></strong></p>
        </fieldset>
        &copy;2026-Syaffiq 
    </body>
</html>
