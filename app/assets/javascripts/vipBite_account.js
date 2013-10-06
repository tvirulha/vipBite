/**
 * Created with JetBrains RubyMine.
 * User: tamv
 * Date: 05/08/13
 * Time: 12:39 AM
 * To change this template use File | Settings | File Templates.
 */


$(document).ready( function() {
    $("#account_BecomingAMemeberButton").click( function (){
        window.location.href = "/register";
        return;
    })

    //set up the log in button action.
    $("#account_LoginButton").click( function (){
        $.ajax({type: 'POST', url: '/Login',
            success: function(data)
            {alert("SWEET YOU HAVE BEEN TRICK!!!! JUST KIDDING.");}});
    });
})
