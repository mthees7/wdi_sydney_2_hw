// When the balance of the bank account is $0 the background of that bank account should be red. It should be gray when there is money in the account.

// If a withdrawal can be covered by the balances in both accounts, take the checking balance down to $0 and take the rest of the withdrawal from the savings account. If the withdrawal amount is more than the combined account balance, ignore it.

window.onload = function () {

    document.getElementById("checkingDeposit").onclick = function(event) {
        // Any code you put in here will be run when the checkingDeposit button is clicked
        var deposit = document.getElementById("checkingAmount").value;
        deposit = parseFloat(deposit);
        checking.deposit(deposit);
        document.getElementById("balance1").innerHTML = "$" + checking.balance;
    };

    document.getElementById("savingsDeposit").onclick = function(event) {
        // Any code you put in here will be run when the savingsDeposit button is clicked
        var deposit = document.getElementById("savingsAmount").value;
        deposit = parseFloat(deposit);
        savings.deposit(deposit);
        document.getElementById("balance2").innerHTML = "$" + savings.balance;
    };

    document.getElementById("checkingWithdraw").onclick = function(event) {
        // Any code you put in here will be run when the checkingWithdraw button is clicked
        var withdraw = document.getElementById("checkingAmount").value;
        withdraw = parseFloat(withdraw);
        if(withdraw <= checking.balance) {
        checking.withdraw(withdraw);
        document.getElementById("balance1").innerHTML = "$" + checking.balance;
        } else if(withdraw <= (checking.balance + savings.balance)) {
          //take checking.balance down to zero.
          var protection = checking.balance;
          checking.balance = 0;
          //reduce savings.balance by the remainder.
          savings.balance = savings.balance - (withdraw - protection);
          document.getElementById("balance1").innerHTML = "$" + checking.balance;
          document.getElementById("balance2").innerHTML = "$" + savings.balance;
        }
          else {
          alert("Sorry, you have insufficient funds.");
        }
    };

    document.getElementById("savingsWithdraw").onclick = function(event) {
        // Any code you put in here will be run when the savingsWithdraw button is clicked
        var withdraw = document.getElementById("savingsAmount").value;
        withdraw = parseFloat(withdraw);
        if(withdraw <= savings.balance) {
        savings.withdraw(withdraw);
        document.getElementById("balance2").innerHTML = "$" + savings.balance;
      } else {
        alert("Sorry, you have insufficient funds.");
      }
    };

    var img = document.getElementById('mainpicture');

    // Add functionality so that a user can deposit money into the bank accounts.
    // Add functionality so that a user can withdraw money from the bank accounts.
};

    var checking = {
        balance: 0,
        deposit: function (amount) {
            this.balance += amount;
        },
        withdraw: function (amount) {
            this.balance -= amount;
        }
    };

    var savings = {
        balance: 0,
        deposit: function (amount) {
            this.balance += amount;
        },
        withdraw: function (amount) {
            this.balance -= amount;
        }
    };