// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/QuizFactory.sol";

contract QuizFactoryTest is Test {
    QuizFactory public factory;

    function setUp() public {
        factory = new QuizFactory();        
    }

    function testCreateQuiz() public {
        string memory question = "What is Love?";
        string memory answer = "Baby don't hurt me";
        bytes32 salt = bytes32("123123123");
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        factory.createQuiz(question, hashedAnswer);
        QuizGame quiz = factory.quizzes(0);
        assertEq(
            keccak256(abi.encodePacked(quiz.question())), 
            keccak256(abi.encodePacked(question)));
    }

    function testCountQuiz() public {
        string memory question = "What is Love?";
        string memory answer = "Baby don't hurt me";
        bytes32 salt = bytes32("123123123");
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        factory.createQuiz(question, hashedAnswer);
        factory.createQuiz(question, hashedAnswer);
        QuizGame[] memory quizzes = factory.getQuizzes();
        assertEq(quizzes.length, 2);
    }
}