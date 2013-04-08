$(function() {
    function vote(id, value) {
        var voteurl = "/" + id + "/vote";
        $.ajax(voteurl, {
            type: 'post',
            dataType: 'json',
            data: {
                value: value
            },
            success: function(data) {
                console.log(data);

                var pic = $('.pic[data-pic="' + id + '"]');

                var upbutton = pic.find('.button.vote.upvote');
                var downbutton = pic.find('.button.vote.downvote');

                if (value) {
                    upbutton.addClass('chosen');
                    downbutton.removeClass('chosen');
                } else {
                    downbutton.addClass('chosen');
                    upbutton.removeClass('chosen');
                }

                var chart = pic.find('.vote-chart');
                var yes   = chart.find('.yes');
                var no    = chart.find('.no');

                yes.text(data.upvote.count);
                yes.width(data.upvote.percentage);
                no.text(data.downvote.count);
                no.width(data.downvote.percentage);
            },
            error: function(jqxhr) {
                if (jqxhr.status == 401) {
                    alert("You must be logged in to vote.");
                } else {
                    alert("An error occurred while casting your vote.");
                }
            }


        });


    }

    $('.button.vote').click(function() {
        var button = $(this);
        var val = button.hasClass('upvote');
        var pic = button.parent().parent().data('pic');
        vote(pic, val);
    });

});