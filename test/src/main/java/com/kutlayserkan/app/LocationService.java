package com.kutlayserkan.app;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

public class LocationService {

    private MongoDatabase database = MongoDBConnection.getDatabase("mezun_portal");

    // Location bilgilerini kaydetme
    public void saveLocation(StudentLocations location) {
        MongoCollection<Document> collection = database.getCollection("locations");

        Document locationDocument = new Document("studentId", location.getStudentId())
                .append("city", location.getCity())
                .append("latitude", location.getLatitude())
                .append("longitude", location.getLongitude());

        collection.insertOne(locationDocument);
    }

    // Konum güncelleme
    public void updateLocation(StudentLocations location) {
        MongoCollection<Document> collection = database.getCollection("locations");

        // Öğrencinin ID'si ile konumu güncelleme işlemi
        Document query = new Document("studentId", location.getStudentId());

        // Güncellenmiş konum bilgilerini içeren yeni Document oluşturuyoruz
        Document update = new Document("$set", new Document("city", location.getCity())
                                                .append("latitude", location.getLatitude())
                                                .append("longitude", location.getLongitude()));

        // Öğrencinin konumunu güncelliyoruz
        collection.updateOne(query, update);
    }

    // Öğrencinin konumunu almak
    public StudentLocations getLocationByStudentId(ObjectId studentId) {
        MongoCollection<Document> collection = database.getCollection("locations");
        Document document = collection.find(new Document("studentId", studentId)).first();

        if (document != null) {
            return new StudentLocations(
                document.getObjectId("studentId"),
                document.getString("city"),
                document.getDouble("latitude"),
                document.getDouble("longitude")
            );
        }
        return null;
    }

    // Tüm konumları al
    public List<StudentLocations> getAllLocations() {
        MongoCollection<Document> collection = database.getCollection("locations");
        List<StudentLocations> locations = new ArrayList<>();

        for (Document document : collection.find()) {
            StudentLocations location = new StudentLocations(
                document.getObjectId("studentId"),
                document.getString("city"),
                document.getDouble("latitude"),
                document.getDouble("longitude")
            );
            locations.add(location);
            
        }

        return locations;
    }
}
