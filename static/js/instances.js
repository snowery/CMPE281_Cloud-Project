

$(function(){


    $('#launchInstance').click(function(){
        $('#instancesTable').hide();
        $('#chooseImage').show();
    });

    $('#onDemond').click(function(e){
        e.preventDefault();
        $('#plan').val('0');
    });
    $('#flatRate').click(function(e){
        e.preventDefault();
        $('#plan').val('1');
    });
    $('.select').click(function(){
         $('#vmName').val($(this).attr('vmName'));
    });

    $('#launch').click(function(){
        alert("in");
        $('#lauchInstanceForm').submit(function(e){
           alert("form");
           e.preventDefault();
           form = $(this).serialize();
           $.ajax({
               url:'/1/instances/launch',
               type:'POST',
               data:form,
               beforeSend:function(){
                 window.location.replace("/1/instances");
               },
               success:function(){
               },
               error:function(){
                  window.location.replace("/1/instances");
                  alert("error");
               }
           });
       });
    });

    $('#checkAll').click(function(){
         if($(this).prop('checked')){
             $('.checkbox').prop("checked", true);
             $('.vmOperation').removeClass("disabled");
         }else{
             $('.checkbox').prop("checked", false);
             $('.vmOperation').addClass("disabled");
         }
    });


    $('.checkbox').click(function(){
        noChecked = true;
        if(!$(this).prop('checked')){
            $('#checkAll').prop('checked', false);
            checkboxes = $('.checkbox');
            len = $('.checkbox').length;
            for(var i = 0; i <  len; i++){
                if($(checkboxes[i]).prop('checked')) {
                    noChecked = false;
                }
            }
            if(noChecked){
                $('.vmOperation').addClass("disabled");
                
            }
        }else{
            $('.vmOperation').removeClass("disabled");
        }
    });

    $('#powerOff').click(function(){
        idArray = setVmId();
        $.ajax({
           url:"/1/instances/"+idArray[0]+"/poweroff",
           type:'GET',
           success:function(data){
               alert(data);
           },
           error:function(){
              alert("error");
           }
        });
    });

    $('#powerOn').click(function(){
        idArray = setVmId();
        $.ajax({
           url:"/1/instances/"+idArray[0]+"/poweron",
           type:'GET',
           success:function(data){
               alert(data);
           },
           error:function(){
              alert("error");
           }
        });
    });

    $('#terminate').click(function(){
        idArray = setVmId();
        $.ajax({
           url:"/1/instances/"+idArray[0]+"/terminate",
           type:'GET',
           success:function(data){
               alert(data);
           },
           error:function(){
              alert("error");
           }
        });
    });
});

function setVmId(){
    var vmId = new Array();
    checkboxes = $('.checkbox');
    len = $('.checkbox').length;
    for(var i = 0; i <  len; i++){
        if($(checkboxes[i]).prop('checked')) {
           vmId.push($(checkboxes[i]).attr('vmId'));
        }
    }
    return vmId;
}