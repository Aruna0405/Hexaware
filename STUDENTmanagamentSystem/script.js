let students = [];

// Add Student
document.getElementById('addStudentBtn').onclick = function() {
    const name = document.getElementById('name').value;
    const age = parseInt(document.getElementById('age').value);
    const grade = parseInt(document.getElementById('grade').value);

    if (name && age && grade) {
        students.push({ name, age, grade });
        alert("Student added successfully!");
        clearForm();
    } else {
        alert("Please fill in all fields.");
    }
};

// View All Students
document.getElementById('viewStudentsBtn').onclick = function() {
    displayStudents(students);
};

// Sort Students by Age in Descending Order
document.getElementById('sortStudentsBtn').onclick = function() {
    const sortedStudents = [...students].sort((a, b) => b.age - a.age);
    displayStudents(sortedStudents);
};

// Delete Student
document.getElementById('deleteStudentBtn').onclick = function() {
    const nameToDelete = prompt("Enter the name of the student you want to delete:");

    if (nameToDelete) {
        const index = students.findIndex(student => student.name.toLowerCase() === nameToDelete.toLowerCase());
        
        if (index !== -1) {
            const confirmDelete = confirm(`Are you sure you want to delete ${students[index].name}?`);
            if (confirmDelete) {
                students.splice(index, 1);
                alert("Student deleted successfully!");
                displayStudents(students);
            }
        } else {
            alert("Student not found.");
        }
    }
};

// Clear form after adding a student
function clearForm() {
    document.getElementById('name').value = '';
    document.getElementById('age').value = '';
    document.getElementById('grade').value = '';
}

// Display students in table
function displayStudents(studentList) {
    const tbody = document.querySelector('#studentTable tbody');
    tbody.innerHTML = '';

    studentList.forEach(student => {
        const row = document.createElement('tr');
        row.classList.add('student-row');

        const nameCell = document.createElement('td');
        nameCell.textContent = student.name;

        const ageCell = document.createElement('td');
        ageCell.textContent = student.age;

        const gradeCell = document.createElement('td');
        gradeCell.textContent = student.grade;

        row.appendChild(nameCell);
        row.appendChild(ageCell);
        row.appendChild(gradeCell);

        tbody.appendChild(row);

        // Mouseover and Mouseout event handling
        row.onmouseover = function() {
            row.style.backgroundColor = '#ffeeba';
        };

        row.onmouseout = function() {
            row.style.backgroundColor = '';
        };
    });
}