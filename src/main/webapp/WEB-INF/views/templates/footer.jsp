<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
var socket = null;
$(document).ready( function() {
    connectWS();	
});

function connectWS() {
/*     console.log("tttttttttttttt") */
    var ws = new WebSocket("ws://localhost:7777/replyEcho?bno=1234");
    socket = ws;

    ws.onopen = function () {
        console.log('Info: connection opened.');
    };

    ws.onmessage = function (event) {   
        sessionStorage.setItem(sessionStorage.length,event.data);
        let $socketAlert = $('div#socketAlert');
        $socketAlert.html(event.data);
        $socketAlert.css('display', 'block');
        
        setTimeout( function() {
        	$socketAlert.css('display', 'none');
        }, 3000); 
    };

    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
        //setTimeout( function(){ connect(); }, 1000); // retry connection!!
    };
    ws.onerror = function (err) { console.log('Error:', err); };
}

</script>
<div class="container-fluid text-center" id="up-on-scroll">

<!-- <section class="page-section bg-whitle text-black" id="up-on-scroll">
      <div class="container px-4 px-lg-5 text-center" id="up-on-scroll">
         <h2 class="mb-4">우리의 프로젝트를 소개합니다!</h2>
         <a class="btn btn-primary btn-xl"
            href="https://github.com/KOSTA224-finalproject/pawPadSmell.net"><h4>Github</h4></a>
         <a class="btn btn-primary btn-xl"
            href="https://ggosoonnet.notion.site/application-properties-5f1884f2d201415e9c1f5d401991b980"><h4>Notion</h4></a>
      </div>
      
   </section> -->
   <div class="bg-light py-5" id="up-on-scroll">
      <div class="container px-4 px-lg-5">
         <div class="text-center text-muted">Copyright &copy; 2021
            - Kosta224 pawPadSmell</div>
            <a href="https://github.com/KOSTA224-finalproject/pawPadSmell.net">Github</a>
         <a href="https://ggosoonnet.notion.site/application-properties-5f1884f2d201415e9c1f5d401991b980">Notion</a>
      </div>
   </div>

</div>