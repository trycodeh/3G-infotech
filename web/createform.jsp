
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<title>3G_INFOTECH</title>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="css/createFormCss.css" rel="stylesheet" type="text/css"/>
</head>
<body style="background-color: rgb(213, 216, 220);">

	<nav class="navbar navbar-expand-lg navbar-light "
		style="display: flex; background-color: rgb(94 165 237);">
		<div class="container-fluid" style="width: 90%;">
			<img alt="" src="./image/logoYT-removebg-preview.png"
				style="height: 70px; ">
		</div>
		<div>
			<button class="bg-blue-500 text-white py-2 px-4  " id="logoutbtn"
                                Style="margin-top: 30px;border-radius: 2cap;margin-bottom: 10px; margin-right: 50px;"
				onclick="window.location.href='index.html'">Logout</button>
		</div>
	</nav>
	<div class="min-h-screen flex">
		<div class="w-64 bg-dark text-white flex flex-col items-center py-4">
                      <% String id = (String) session.getAttribute("userid");%>
                         <img class="rounded-full mb-4" src="displayImage?id=<%=id %>"  style="height: 100px; widht: 100px; backgroung-color: white;" alt="User Photo">
                         
                <span class="text-xl font-semibold mb-4">Test User</span>
        <nav class="flex flex-col w-full px-4">
            <a href="home.jsp" class="flex items-center py-2 px-4  rounded" id="button">
                <span class="material-icons">grid_view</span> <span class="ml-2">Home</span>
            </a> 
            <a href="#" class="flex items-center py-2 px-4 bg-cyan-500 rounded mt-2">
                <span class="material-icons">add_circle</span> <span class="ml-2">Create Form</span>
            </a> 
            <a href="form_list.jsp" class="flex items-center py-2 px-4  rounded mt-2" id="button">
                <span class="material-icons">list</span> <span class="ml-2">List of Forms</span>
            </a>
        </nav>
    </div>
		<div class="flex-1 p-6 " style="margin-right: 30%;  margin-left: 2cap; background-color: rgb(213, 216, 220 );">
			  <form id="questionForm" method="post" action="Form_submit.jsp" >
        <div>
            <label for="formTitle">Form Title:</label><br>
            <input type="text" id="formTitle" name="formTitle" required><br><br>
        </div>
        <div>
            <label for="formDescription">Form Description:</label><br>
            <textarea id="formDescription" name="formDescription" rows="4" cols="50" required></textarea><br><br>
        </div>
        <div id="questions">
            <div class="question">
                <div class="question-row1">
                    <label for="questionText">Question:</label><br>
                    <input type="text" name="question[]"  style="font-weight: bold" required>
                </div>
                <div class="question-row" >
                   
                    <select name="questionType[]" onchange="showInput(this)" required>
                        <option value="rating">Star Rating</option>
                        <option value="smiley">Smiley Rating</option>
                        <option value="short_answer">Short Answer</option>
                    </select>
                </div>
                <i class="fa fa-trash" onclick="deleteQuestion(this)"></i>
            </div>
        </div>
        <button type="button" onclick="addQuestion()">Add Question</button><br><br>
        <input type="submit" value="Submit">
    </form>

		</div>
	</div>

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
    <script>
        function addQuestion() {
            var questionsDiv = document.getElementById('questions');
            var questionCount = questionsDiv.querySelectorAll('.question').length;
            if (questionCount >= 5) {
                alert('You can only add a maximum of 5 questions.');
                return;
            }

            var newQuestion = document.createElement('div');
            newQuestion.classList.add('question');
            newQuestion.innerHTML = `
                <div class="question-row">
                    <label for="questionText">Question:</label<br>
                    <input type="text" name="question[]" required>
                </div>
                <div class="question-row">

                    <select name="questionType[]" onchange="showInput(this)" required>
                        <option value="rating">Star Rating</option>
                        <option value="smiley">Smiley Rating</option>
                        <option value="short_answer">Short Answer</option>
                    </select>
                </div>
               <i class="fa fa-trash" onclick="deleteQuestion(this)"></i>
            `;
            questionsDiv.appendChild(newQuestion);
        }

        function deleteQuestion(button) {
            var questionDiv = button.parentNode;
            questionDiv.parentNode.removeChild(questionDiv);
        }

        function showInput(select) {
            var questionType = select.value;
            var parentDiv = select.parentNode;
            var inputContainer = parentDiv.querySelector('.input-container');

            // Remove existing input elements
            if (inputContainer) {
                parentDiv.removeChild(inputContainer);
            }

            // Show input elements based on selected question type
            if (questionType === 'rating') {
                var ratingInput = document.createElement('div');
                ratingInput.classList.add('input-container');
                ratingInput.innerHTML = `
                   
                    <div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5"></label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4"></label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3"></label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2"></label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1"></label>
                    </div>
                `;
                parentDiv.appendChild(ratingInput);
            } else if (questionType === 'smiley') {
                var smileyInput = document.createElement('div');
                smileyInput.classList.add('input-container');
                smileyInput.innerHTML = `
                  
                    <div class="smiley-rating">
                        <span>&#128512;</span>
                        <span>&#128578;</span>
                        <span>&#128528;</span>
                        <span>&#128533;</span>
                        <span>&#128546;</span>
                    </div>
                `;
                parentDiv.appendChild(smileyInput);
            }
        }
    </script>
</body>
</html>