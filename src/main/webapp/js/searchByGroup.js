const studentsListGroup = document.getElementById('studentsListGroup');
const selectBar = document.getElementById('selectBar');
let studentsGroup = [];

selectBar.addEventListener('change', (e) => {
    const searchString = e.target.value.toLowerCase();

    const filteredCharacters = studentsGroup.filter((character) => {
        return (
            character.group.name.toLowerCase().includes(searchString)
        );
    });
    displayStudentsGroup(filteredCharacters);
});

const loadStudentsGroup = async () => {
    try {

        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/students",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                studentsGroup = resultData;
                // displayStudentsGroup(studentsGroup)
            },
            error: function (jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
    } catch (err) {
        console.error(err);
    }
};

const displayStudentsGroup = (characters) => {
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
    studentsListGroup.innerHTML = htmlString;
};

loadStudentsGroup();

