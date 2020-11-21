const studentsListMajor = document.getElementById('studentsListMajor');
const selectBarMajor = document.getElementById('selectBarMajor');
let studentsMajor = [];

selectBarMajor.addEventListener('change', (e) => {
    const searchString = e.target.value.toLowerCase();
    const filteredCharacters = studentsMajor.filter((character) => {
        return (
            character.major.name.toLowerCase().includes(searchString)
        );
    });
    displayStudentsMajor(filteredCharacters);
});

const loadStudentsMajor = async () => {
    try {

        jQuery.ajax({
            url: "http://localhost:8080/finalproj_war_exploded/api/students",
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (resultData) {
                studentsMajor = resultData;
                displayStudentsGroup(studentsGroup)
            },
            error: function (jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
    } catch (err) {
        console.error(err);
    }
};

const displayStudentsMajor = (characters) => {
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
                            
                            </form>
                        </td>
                    
                </tr>
                
        `;
        })
        .join('');
    studentsListMajor.innerHTML = htmlString;
};

loadStudentsMajor();

