import UIKit

// Loan amount in whole dollars (Int).
var p : Int = 20000

// Number of payments (Int).
var n : Int = 2

// Interest rate per payment period (Double).
var r : Double = 0.044/12


// Calculates the estimated payment.
// Function returns float.
// if interestRate is a Float i get an incorrect number of cents.
//Formatting required after return.
//             r(1 + r)^n
// EMI = P * -------------
//           (1 + r)^n - 1
func Payment(_ loanAmt: Int, _ numPayments: Int, _ interestRate: Double) -> Float {
    
    // temp variable for (1 + r)^n
    var temp1 = (1 + interestRate)
    temp1 = pow(temp1, Double(numPayments))
    
    var temp2 = (interestRate * temp1) / (temp1 - 1)
    var paymentAmt = Double(loanAmt) * temp2
    return(Float(paymentAmt))
}


// Problem one with passed variables.
print("Problem one: (with passed variables)")
print("The loan payment for a $20,000 loan with a 4.4% APR, compounded mounthly is ")
var estPayment = Payment(p, n, r)
print(estPayment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
print()

// Problem one with passed values.
print("Problem one: (with passed values, same answer...)")
print("The loan payment for a $20,000 loan with a 4.4% APR, compounded mounthly is ")
estPayment = Payment(20000, 2, 0.044/12)
print(estPayment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
print()

// Problem two with passed values.
print("Problem two: (with passed values)")
print("The loan payment for a $150,000 loan with a 5.0% APR, with anual paymenst is ")
estPayment = Payment(150000, 30, 0.05)
// I think the formatting is changing .715 to .71 instead of .72
print(estPayment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
