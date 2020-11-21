const studentsListYear = document.getElementById('studentsListYear');
const selectBarYear = document.getElementById('selectBarYear');
let studentsYear = [];

selectBarYear.addEventListener('change', (e) => {
    const searchString = e.target.value;
    const filteredCharacters = studentsYear.filter((character) => {
        if (character.year == searchString) {
            return (
                character
            );
        }
    });
    displayStudentsYear(filteredCharacters);
});

const loadStudentsYear = async () => {
    try {

        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/students",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                studentsYear = resultData;
                displayStudentsYear(studentsYear)
            },
            error: function (jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
    } catch (err) {
        console.error(err);
    }
};

const displayStudentsYear = (characters) => {
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
                    </form>
                </tr>
        `;
        })
        .join('');
    studentsListYear.innerHTML = htmlString;
};

loadStudentsYear();

