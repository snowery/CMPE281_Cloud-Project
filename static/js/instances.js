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
               success:function(){
                    window.location.replace("/1/instances");
               },
               error:function(){
                  alert("error");
               }
           });
       });
    });

});