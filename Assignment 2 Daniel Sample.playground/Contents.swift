import UIKit

// Loan amount in whole dollars (Int).
var p : Int = 20000

// Number of payments (Int).
var n : Int = 2

// Interest rate per payment period (Double).
var r : Double = 0.044/12


// Calculates the estimated payment.
// Function returns double.  Formatting required after return.
//             r(1 + r)^n
// EMI = P * -------------
//           (1 + r)^n - 1
func calcPayment(_ loanAmt: Int, _ numPayments: Int, _ interestRate: Double) -> Double {
    
    // temp variable for (1 + r)^n
    var temp1 = (1 + interestRate)
    temp1 = pow(temp1, Double(numPayments))
    
    var temp2 = (interestRate * temp1) / (temp1 - 1)
    var payment = Double(loanAmt) * temp2
    return(payment)
}


// Problem one with passed variables.
print("Problem one: (with passed variables)")
print("The loan payment for a $20,000 loan with a 4.4% APR, compounded mounthly is ")
var payment = calcPayment(p, n, r)
print(payment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
print()

// Problem one with passed values.
print("Problem one: (with passed values, same answer...)")
print("The loan payment for a $20,000 loan with a 4.4% APR, compounded mounthly is ")
payment = calcPayment(20000, 2, 0.044/12)
print(payment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
print()

// Problem two with passed values.
print("Problem two: (with passed values)")
print("The loan payment for a $150,000 loan with a 5.0% APR, with anual paymenst is ")
payment = calcPayment(150000, 30, 0.05)
print(payment.formatted(.currency(code: "USD").presentation(.narrow).rounded()))
