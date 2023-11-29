// StringConstants.swift
// Created by Nate Birkholz

import Foundation

struct StringConstants {
    static let pasteButton = "Paste"
    static let copyButton = "Copy"
    static let clearButton = "Clear"
        
    static let clearTitle = "Are you sure you want to clear all text?"
    static let errorTitle = "Oh no! Error!"
    
    static let yesButton = "Yes"
    static let noButton = "No"
    static let bummerButton = "OK"
    
    static let emptyPasteError = "No string found to paste."
    static let notDataError = "Pasted string unexpectedly could not be converted to Data."
    static let notJSONError = "Pasted dtring could not be converted to valid JSON: "
    static let cantMakeStringError = "Unexpected string data error."
    static let unknonwError = "An unknown error has been encountered."
}

extension StringConstants {
    static let testString = "[\n  {\n    \"postId\": 1,\n    \"id\": 1,\n    \"name\": \"id labore ex et quam laborum\",\n    \"email\": \"Eliseo@pretendurl.com\",\n    \"body\": \"laudantium enim quasi est quidem magnam voluptate ipsam eos\\ntempora quo necessitatibus\\ndolor quam autem quasi\\nreiciendis et nam sapiente accusantium\"\n  },\n  {\n    \"postId\": 1,\n    \"id\": 2,\n    \"name\": \"quo vero reiciendis velit similique earum\",\n    \"email\": \"Jayne_Kuhic@pretendurl.com\",\n    \"body\": \"est natus enim nihil est dolore omnis voluptatem numquam\\net omnis occaecati quod ullam at\\nvoluptatem error expedita pariatur\\nnihil sint nostrum voluptatem reiciendis et\"\n  },\n  {\n    \"postId\": 1,\n    \"id\": 3,\n    \"name\": \"odio adipisci rerum aut animi\",\n    \"email\": \"Nikita@pretendurl.com\",\n    \"body\": \"quia molestiae reprehenderit quasi aspernatur\\naut expedita occaecati aliquam eveniet laudantium\\nomnis quibusdam delectus saepe quia accusamus maiores nam est\\ncum et ducimus et vero voluptates excepturi deleniti ratione\"\n  },\n  {\n    \"postId\": 1,\n    \"id\": 4,\n    \"name\": \"alias odio sit\",\n    \"email\": \"Lew@pretendurl.com\",\n    \"body\": \"non et atque\\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\\nquia voluptas consequuntur itaque dolor\\net qui rerum deleniti ut occaecati\"\n  },\n  {\n    \"postId\": 1,\n    \"id\": 5,\n    \"name\": \"vero eaque aliquid doloribus et culpa\",\n    \"email\": \"Hayden@pretendurl.com\",\n    \"body\": \"harum non quasi et ratione\\ntempore iure ex voluptates in ratione\\nharum architecto fugit inventore cupiditate\\nvoluptates magni quo et\"\n  }\n]"
}
