$(document).ready(function(){
  
    $(".container").hide();    
    $("#container-webhook").hide();    
    $("#container-clanName").hide();
    $("#container-invite").hide(); 
    $("#container-clanrename").hide();
    $("#container-leadership").hide(); 
    
    window.addEventListener('message', function(event){
        var data = event.data;
        type=data.action;
        if (data.action == "createwebhook") {
            $(".container").fadeIn(1000);
            $("#container-webhook").fadeIn(0);

        }
        else  if (data.action == "createclan") {
            $(".container").fadeIn(1000);
            $("#container-clanName").fadeIn(0);
        }
        else  if (data.action == "invite") {
            $(".container").fadeIn(1000);
            $("#container-invite").fadeIn(0);
        }
        else  if (data.action == "clanrename") {
            $(".container").fadeIn(1000);
            $("#container-clanrename").fadeIn(0);
        }
        else  if (data.action == "leadership") {
            $(".container").fadeIn(1000);
            $("#container-leadership").fadeIn(0);
        }

    });


});
$(document).on('keypress',function(e) {
    if(e.which == 13) {
        $(".container").hide();    
        $("#container-webhook").hide();    
        $("#container-clanName").hide();
        $("#container-invite").hide(); 
        $("#container-clanrename").hide();
        $("#container-leadership").hide();  
  
        if(type=="createwebhook")
        $.post('http://syn_clan/createwebhook', JSON.stringify({webhook:$("#webhook").val()}));
        else if(type=="createclan")
        $.post('http://syn_clan/createclan', JSON.stringify({clanName:$("#clanName").val()}));
        else if(type=="invite")
        $.post('http://syn_clan/inviteplayer', JSON.stringify({playerID:$("#playerID").val()}));
        else if(type=="clanrename")
        $.post('http://syn_clan/clanrename', JSON.stringify({clanrename:$("#clanrename").val()}));
        else if(type=="leadership")
        $.post('http://syn_clan/leadership', JSON.stringify({leadership:$("#leadership").val()}));



    }
});