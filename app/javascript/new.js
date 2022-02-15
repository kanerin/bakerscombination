
$(function(){
    $('#file').change(function(){
        $('img').remove();
        var file = $(this).prop('files')[0];
        if(!file.type.match('image.*')){
            return;
        }
        var fileReader = new FileReader();
        fileReader.onloadend = function() {
            $('#result').html('<img src="' + fileReader.result + '"/>');
        }
        fileReader.readAsDataURL(file);
    });
});