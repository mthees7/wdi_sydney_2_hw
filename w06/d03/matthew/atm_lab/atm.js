// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){


  document.getElementById("checkingDeposit").onclick = function(event){
  // Any code you put in here will be run when the checkingDeposit button is clicked
    var amount = document.getElementById('checkingAmount').value;
    amount = parseFloat(amount);
    checking.deposit(amount);
    document.getElementById('balance1').innerHTML = checking.balance;

  };

  document.getElementById("savingsDeposit").onclick = function(event){
  // Any code you put in here will be run when the savingsDeposit button is clicked
    var amount = document.getElementById('savingsAmount').value;
    amount = parseFloat(amount);
    savings.deposit(amount);

    document.getElementById('balance2').innerHTML = savings.balance;

  };

  document.getElementById("checkingWithdraw").onclick = function(event){
  // Any code you put in here will be run when the checkingWithdraw button is clicked
    var amount = document.getElementById('checkingAmount').value;
    amount = parseFloat(amount);
    checking.withdrawal(amount);

    document.getElementById('balance1').innerHTML = checking.balance;
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
  // Any code you put in here will be run when the savingsWithdraw button is clicked
    var amount = document.getElementById('savingsAmount').value;
    amount = parseFloat(amount);
    savings.withdrawal(amount);

    document.getElementById('balance2').innerHTML = savings.balance;
  };


//goes and checks the balance to determine the color the div should be
  checkingCheck(checking.balance);
  savingsCheck(savings.balance);


};



//========================================================
// The check for sufficient Funds Functions
//========================================================



var suffiencientFunds1 = function (amount) {
  debugger;
  if (checking.balance < amount) {
    return false;
  } else {
    return true;
  }
}

var suffiencientFunds2 = function (amount) {
  debugger;
  if (savings.balance < amount) {
    return false;
  } else {
    return true;
  }
}


//========================================================
// Deposit and Withdrawal Functions
//========================================================


var checking = {
  balance: 0,
  deposit: function (amount){
    console.log(amount);
    var new_balance = this.balance += amount;
    // document.getElementById('balance1').innerHTML = new_balance
    checking.balance = new_balance;
//changes the color
    checkingCheck();
  },
  withdrawal: function (amount){
    if(suffiencientFunds1(amount)) {
      this.balance -= amount;
    } else {
      alert("You don't have enough man.");
    }
//changes the color
    checkingCheck();
  }
};


var savings = {
  balance: 0,
  deposit: function (amount){
    var new_balance = this.balance += amount;
    //document.getElementById('balance2').innerHTML = new_balance;
    savings.balance = new_balance;
//changes the color
    savingsCheck();
  },
  withdrawal: function (amount){
    if(suffiencientFunds2(amount)) {
      this.balance -= amount;
    } else {
      alert("You don't have enough man.");
    }
//changes the color
    savingsCheck();
  }
};


//========================================================
// Turn the damn thing Red or Grey
//========================================================


var checkingCheck = function() {
  if (checking.balance === 0) {
    var dangerbalance = document.getElementById("checkingAccount");
    dangerbalance.style.backgroundColor = "Red";
  } else {
    var dangerbalance = document.getElementById("checkingAccount");
    dangerbalance.style.backgroundColor = "Grey";
  }
}


var savingsCheck = function() {
  if (savings.balance === 0) {
    var dangerbalance = document.getElementById("savingsAccount");
    dangerbalance.style.backgroundColor = "Red";
  } else {
    var dangerbalance = document.getElementById("savingsAccount");
    dangerbalance.style.backgroundColor = "Grey";
  }
}


