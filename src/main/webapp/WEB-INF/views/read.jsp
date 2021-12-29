<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "isTest" scope = "page" value = "${false}"/> <!-- QQQ -->

<%@ include file="../header.jsp"%>

<script>
	var result = '${msg}';
	if (result === 'save-ok') {
		alert("Update Completed.");
	}
</script>

<c:if test="${ true eq isTest }">
<%@include file="../qunit.jsp"%>
</c:if>

<section class="content">
	<div class="box-body">
		<div class="form-group">
			<label for="title">제목</label> <span>${ board.title }</span>
		</div>

		<div class="form-group">
			<label for="content">내용</label> <span>${ board.content }</span>
		</div>

		<div class="form-group">
			<label for="writer">작성자</label> <span>${ board.writer }</span>
		</div>

		<div class="form-group">
			<label for="writer">조회수</label> <span>${ board.viewcnt }</span>
		</div>
	</div>

	<ul class="mailbox-attachments clearfix uploadedList">
	    <%@ include file="uploadedFiles.jsp"%>	
	</ul>

	<script id="replies" type="text/x-handlebars-template" class="well">
			
<ul class="list-group">
          {{#each list}}
			<a href="#" class="list-group-item" onclick="editReply('{{../loginUid}}', {{rno}}, '{{replyer}}', '{{transHtml replytext}}')">
			     {{{transHtml replytext}}}
			     <small class="text-muted pull-right">
                    {{fromNow regdate}}
                    <i class="fa fa-user ml10"></i> {{replyer}}
                 </small>
		    </a>
          {{/each}}
		</ul>

		<nav aria-label="Page navigation" class="text-center">
		  <ul class="pagination">
          {{#if pageData.prevPage}}
		    <li>
		      <a href="#" onclick="listPage({{pageData.prevPage}})" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
          {{/if}}

          {{#each pageData.pages as |page|}}
		    <li class="{{#if (eq ../currentPage page)}}active{{/if}}">
                <a href="#" onclick="listPage({{page}})">
                   {{page}} 
                </a>
            </li>
          {{/each}}

          {{#if pageData.nextPage}}
		    <li>
		      <a href="javascript:;" onclick="listPage({{pageData.nextPage}})" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
          {{/if}}
		  </ul>

          {{#if loginUid}}
             <button onclick="editReply('{{loginUid}}')" class="btn btn-success pull-right">댓글쓰기</button>
          {{/if}}
		</nav>
	</script>

	<div class="box-footer text-center">
	  <c:if test="${ loginUser.uid == board.writer }">
		<button id="btn-remove-read" class="btn btn-danger">삭제</button>
		<a href="/board/update${criteria.makeQuery()}&bno=${ board.bno }"
			class="btn btn-primary">수정</a>
	  </c:if>
		<a href="/board/listPage${criteria.makeQuery()}" class="btn btn-default">목록</a>
	</div>
	
	<div class="well">
	   <input type="text" id="msg" value="1212" class="form-control" />
	   <button id="btnSend" class="btn btn-primary">Send Message</button>
	</div>
</section>

<script type="text/x-handlebars-template" class="modal fade" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">댓글 {{#if gIsEdit}}수정{{else}}등록{{/if}}</h4>
      </div>
      <div class="modal-body">
        <div>
            작성자
            <input type="text" name="replyer" id="replyer" onkeyup="checkEdit()"
             value="{{replyer}}" {{#if gIsEdit}}readonly{{/if}} class="form-control" readonly />
        </div>
        <div class="mt10">
            내용<textarea name="replytext" id="replytext" onkeyup="checkEdit()" rows="3" class="form-control">{{replytext}}</textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button onclick="save()" id="btnModReply" class="btn btn-primary">
          {{#if gIsEdit}}
            수정
          {{else}}
            등록
          {{/if}}
        </button>
        {{#if gIsEdit}}
            <button onclick="removeReply()" id="btnDelReply" class="btn btn-danger">삭제</button>
        {{/if}}
        <button onclick="closeMod()" id="btnCloseReply" class="btn btn-default">닫기</button>
      </div>
    </div>
  </div>
</script>

<script src="../resources/reply.js?ver=7"></script>

<c:if test="${ true eq isTest }">
<script src="../resources/test/replytest.js"></script>
</c:if>

<script>
$(document).ready(	function() {
	// var $boxFooter = $("section.content div.box-footer");

	$('#btn-remove-read').on('click', function() {
		if (confirm("Are u sure??")) {
			self.location.href = "/board/remove${criteria.makeQuery()}&bno=${board.bno}";
		}
	});
	
	listPage(1, '${board.bno}'); // QQQ
	gBno = '${board.bno}';
	gBoardWriter = '${board.writer}';

	//$('#myModal').modal('show');
	
    showAttaches(${board.bno});	
    
    gIsDirect = true;
    
    $('#btnSend').on('click', function(evt) {
    	evt.preventDefault();
    	if (socket.readyState !== 1) return;
    	
   	    let msg = $('input#msg').val();
   	    socket.send(msg);
   	});
    
});
</script>

<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<script type="text/babel">
const fn = ii => ii *2;
// console.log("fn=", fn(2))

const fn2 = (aa=123) => {
    console.log(`aa=${aa}`)
}
</script>

<%@ include file="../footer.jsp"%>
</html>