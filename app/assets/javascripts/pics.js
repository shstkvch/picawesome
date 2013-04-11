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

                var vote_count = data.upvote_count + data.downvote_count;

                yes.text(data.upvote_count);
                yes.width((data.upvote_count / vote_count * 100).toString() + "%");
                no.text(data.downvote_count);
                no.width((data.downvote_count / vote_count * 100).toString() + "%");
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

    $('.styleomatic').css("background-color", $('.settings-transfer.bg-color').text());

    var bgcolor = $.color($('.styleomatic').css("background-color")); // Read back out to convert named colors

    var r = bgcolor.red()   * 255;
    var g = bgcolor.green() * 255;
    var b = bgcolor.blue()  * 255;
    var yiq = (r * 299 + g * 587 + b * 114) / 1000;
    if (yiq >= 128) {
        $('.styleomatic').addClass('invert');
    }




});