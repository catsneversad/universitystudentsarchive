$(document).ready(function() {
    $('#news').click(function(){
            $('#news').addClass('sb active');
            $('.newsInfo').css('display','none');
            $('#clubs').removeClass('sb active');
            $('.clubsInfo').css('display','none');
            $('#events').removeClass('sb active');
            $('.eventsInfo').css('display','none');
        }
    );
    $('#clubs').click(function(){
            $('#clubs').addClass('sb active');
            $('.clubsInfo').css('display','none');
            $('#news').removeClass('sb active');
            $('.newsInfo').css('display','none');
            $('#events').removeClass('sb active');
            $('.eventsInfo').css('display','none');
        }
    );
    $('#events').click(function(){
            $('#events').addClass('sb active');
            $('.eventsInfo').css('display','none');
            $('#clubs').removeClass('sb active');
            $('.clubsInfo').css('display','none');
            $('#news').removeClass('sb active');
            $('.newsInfo').css('display','none');
        }
    );
});
