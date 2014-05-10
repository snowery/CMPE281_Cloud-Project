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
});