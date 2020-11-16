$(document).ready(function() {
    $('#news').click(function(){
            $('#news').addClass('sb active');
            $('.newsInfo').removeClass('close');
            $('#clubs').removeClass('sb active');
            $('#clubsInfo').addClass('close');
            $('#events').removeClass('sb active');
            $('#eventsInfo').addClass('close');
        }
    );
    $('#clubs').click(function(){
            $('#clubs').addClass('sb active');
            $('#clubsInfo').removeClass('close');
            $('#news').removeClass('sb active');
            $('#newsInfo').addClass('close');
            $('#events').removeClass('sb active');
            $('#eventsInfo').addClass('close');
        }
    );
    $('#events').click(function(){
            $('#events').addClass('sb active');
            $('#eventsInfo').removeClass('close');
            $('#clubs').removeClass('sb active');
            $('#clubsInfo').addClass('close');
            $('#news').removeClass('sb active');
            $('#newsInfo').addClass('close');
        }
    );
});
