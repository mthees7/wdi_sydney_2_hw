// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){

    // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
    // The click event is raised when the user clicks on an element.
    document.getElementById("checkingDeposit").onclick = function(event){
      var amount = document.getElementById("checkingAmount").value;
      amount = parseFloat(amount); //to change it into an intger
      checking.deposit(amount);
      document.getElementById('balance1').innerHTML = checking.balance;
    };

    document.getElementById("savingsDeposit").onclick = function(event){
      //when the user clicks on savings deposit, this code inside the function will run
      var amount = document.getElementById("savingsAmount").value;
      amount = parseFloat(amount);
      savings.deposit(amount);
      document.getElementById('balance2').innerHTML = savings.balance;
    };

    document.getElementById("checkingWithdraw").onclick = function(event){
      // Any code you put in here will be run when the checkingWithdraw button is clicked
     var amount = document.getElementById("checkingAmount").value;
       if (checking.withdraw(amount) === true) {
        alert('okay!');
       } else {
        alert('insufficient funds');
       }
       if (balanceZero(checking.balance) === true) {
        checkingCheck.style.backgroundColor = 'red';
       } else {
          checkingCheck.style.backgroundColor = 'grey';

       };
       document.getElementById('balance1').innerHTML = checking.balance;
    };

    document.getElementById("savingsWithdraw").onclick = function(event){
      // Any code you put in here will be run when the savingsWithdraw button is clicked
     var amount = document.getElementById("savingsAmount").value;
      if (savings.withdraw(amount) === true) {
        alert('okay!');
       } else {
        alert('insufficient funds');
       }
       if (balanceZero(checking.balance) === true) {
          savingsCheck.style.backgroundColor = 'red';
       } else {
          savingsCheck.style.backgroundColor = 'grey';

        };
       document.getElementById('balance2').innerHTML = savings.balance;
  };

  var totalFunds= function(){
    var funds = checking.balance + savings.balance;
    return funds;
  };

  var sufficientFunds = function(amount){
    console.log(totalFunds());
    if (amount <= totalFunds()) {
      return true;
    } else {
      return false;
    }

  };

  var checking = {
    balance: 0,
    deposit: function(amount){
      this.balance += amount;
    },
    withdraw: function(amount){
      // if the there is enough money in this account take it out
      if (sufficientFunds(amount)) {
        if (this.balance >= amount) {
          this.balance -= amount;
        } else {
          // take the balancce out of this account and then work out the remanider and take it out of the
          // saving account.
          savings.balance = savings.balance - (amount - this.balance);
          this.balance = 0;
        }
        // if there is sufficient funds return true, else return false, which we call later to alert customer
        return true;
      } else {
        return false;
      }
    }
  };

  var savings = {
    balance: 0,
    deposit: function(amount){
      this.balance += amount;
    },
    withdraw: function(amount){
      if (sufficientFunds(amount)) {
        if (this.balance >= amount) {
          this.balance -= amount;
        } else {

          checking.balance = checking.balance - (amount - this.balance);
          this.balance = 0;
        }
        // if there is sufficient funds return true, else return false, which we call later to alert customer
        return true;
      } else {
        return false;
      }
    }
  };

  var checkingCheck = document.getElementById('checkingAccount');
  var savingsCheck = document.getElementById('savingsAccount');

  var balanceZero = function (zeroBal) {
    return(zeroBal === 0);
  };




}

