const studentsList = document.getElementById('studentsList');
const searchBar = document.getElementById('searchBar');
let students = [];

searchBar.addEventListener('keyup', (e) => {
    const searchString = e.target.value.toLowerCase();

    const filteredCharacters = students.filter((character) => {
        return (
            character.firstName.toLowerCase().includes(searchString) ||
            character.lastName.toLowerCase().includes(searchString)
        );
    });
    displayStudents(filteredCharacters);
});

const loadStudents = async () => {
    try {

        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/students",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                students = resultData;
                // displayStudents(students)
            },
            error: function (jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
    } catch (err) {
        console.error(err);
    }
};

const displayStudents = (characters) => {
    id = 0;
    const htmlString = characters
        .map((character) => {
            return `
                <tr>
                    
                        <td>${character.firstName}
                        </td>
                        <td>${character.lastName}
                        </td>
                        <td>${character.email}
                        </td>
                        <td>
                        <form action="editStudent.jsp" method="get">
                            <input type="text" name="id" style="display: none"
                                   id="id${character.id}"
                                   value="${character.id}">
                            <button class="btn btn-info mt-2" id="edit${character.id}">Edit
                                student
                            </button>
                            </form>
                        </td>
                    
                </tr>
        `;
        })
        .join('');
    studentsList.innerHTML = htmlString;
};

loadStudents();

