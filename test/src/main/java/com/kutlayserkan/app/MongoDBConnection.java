package com.kutlayserkan.app;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {
    private static MongoClient mongoClient;

    public static MongoClient getConnection() {
        if (mongoClient == null) {
            mongoClient = MongoClients.create("mongodb://localhost:27017"); // MongoDB bağlantı URI
        }
        return mongoClient;
    }

    public static MongoDatabase getDatabase(String dbName) {
        return getConnection().getDatabase(dbName);
    }
}
