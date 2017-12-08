jQuery(function($){
    $('comment').click(function(){
        if(!$(this).hasClass('on')){
            $(this).addClass('on');
            var comment_t = $(this).text();
            $(this).html('<input type="text" value="'+comment_t+'" />');
            $('comment > input').focus().blur(function(){
                var inputVal = $(this).val();
                if(inputVal===''){
                    inputVal = this.defaultValue;
                };
                $(this).parent().removeClass('on').text(inputVal);
            });
        };
    });
});
