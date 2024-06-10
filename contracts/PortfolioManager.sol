// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PortfolioManager {
    struct Person {
        string name;
        uint256 experience; //in years
        string contact;
    }

    struct Category {
        string name;
        Person[] people;
    }

    mapping(string => Category) private categories;
    string[] private categoryNames;

    function addCategory(string memory category) public {
        require(bytes(category).length > 0, "Category name cannot be empty");
        categories[category].name = category;
        categoryNames.push(category);
    }

    function addPerson(
        string memory category,
        string memory _name,
        uint256 _experience,
        string memory _contact
    ) public {
        require(bytes(category).length > 0, "Category cannot be empty");
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(bytes(_contact).length > 0, "Contact cannot be empty");

        Person memory newPerson = Person(_name, _experience, _contact);
        categories[category].people.push(newPerson);
    }

    function getCategoryNames() public view returns (string[] memory) {
        return categoryNames;
    }

    function getPeopleInCategory(string memory _category) public view returns (Person[] memory) {
        return categories[_category].people;
    }

    function getPersonDetails(string memory _category, uint256 _index) public view returns (string memory, uint256, string memory) {
        Person memory person = categories[_category].people[_index];
        return (person.name, person.experience, person.contact);
    }
}