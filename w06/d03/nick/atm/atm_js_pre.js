function main() {
  return 'Hello, World!';
}

main();

// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function () {

    // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
    // The click event is raised when the user clicks on an element.
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
        checking.withdraw(withdraw);
        document.getElementById("balance1").innerHTML = "$" + checking.balance;
    };

    document.getElementById("savingsWithdraw").onclick = function(event) {
        // Any code you put in here will be run when the savingsWithdraw button is clicked
        var withdraw = document.getElementById("savingsAmount").value;
        withdraw = parseFloat(withdraw);
        savings.withdraw(withdraw);
        document.getElementById("balance2").innerHTML = "$" + savings.balance;
    };

    var img = document.getElementById('mainpicture');

    // Add functionality so that a user can deposit money into the bank accounts.
    // Add functionality so that a user can withdraw money from the bank accounts.

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
};