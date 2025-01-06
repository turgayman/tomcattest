package com.kutlayserkan.app;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

public class UserService {

    private MongoDatabase database = MongoDBConnection.getDatabase("mezun_portal");

    // Kullanıcı kaydetme
    public void saveUser(String username, String password) {
        MongoCollection<Document> collection = database.getCollection("users");

        Document userDocument = new Document("username", username)
                .append("password", password); // Şifreyi hash'lemek önerilir (ör. BCrypt)

        collection.insertOne(userDocument);
    }

    // Kullanıcı doğrulama
    public boolean authenticateUser(String username, String password) {
        MongoCollection<Document> collection = database.getCollection("users");

        Document user = collection.find(new Document("username", username)).first();

        if (user != null && user.getString("password").equals(password)) {
            return true;
        }

        return false;
    }
}