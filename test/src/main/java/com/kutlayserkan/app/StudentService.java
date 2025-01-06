package com.kutlayserkan.app;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

public class StudentService {
    
    private MongoDatabase database = MongoDBConnection.getDatabase("mezun_portal"); // Veritabanı adı

    public void saveStudent(StudentModel student) {
        MongoCollection<Document> collection = database.getCollection("students"); // Koleksiyon adı

        // Yeni öğrenci için ObjectId oluştur
        ObjectId nextId = new ObjectId(); // MongoDB, ObjectId'yi otomatik olarak oluşturur

        Document studentDocument = new Document("_id", nextId) // ObjectId'yi ekle
                                        .append("adi", student.getAdi())
                                        .append("soyadi", student.getSoyadi())
                                        .append("mezuniyetYili", student.getMezuniyetYili());

        collection.insertOne(studentDocument); // MongoDB'ye ekle
    }

    public List<StudentModel> getAllStudents() {
        MongoCollection<Document> collection = database.getCollection("students");

        List<StudentModel> students = new ArrayList<>();
        FindIterable<Document> documents = collection.find();

        for (Document document : documents) {
            StudentModel student = new StudentModel();
            
            // ObjectId'yi alıyoruz
            student.setId(document.getObjectId("_id"));
            student.setAdi(document.getString("adi"));
            student.setSoyadi(document.getString("soyadi"));
            student.setMezuniyetYili(document.getInteger("mezuniyetYili"));
            students.add(student);
        }
        return students;
    }

    public StudentModel getStudentById(ObjectId studentId) {
        MongoCollection<Document> collection = database.getCollection("students");

        Document query = new Document("_id", studentId);
        Document studentDoc = collection.find(query).first();

        if (studentDoc != null) {
            StudentModel student = new StudentModel();
            student.setId(studentDoc.getObjectId("_id"));
            student.setAdi(studentDoc.getString("adi"));
            student.setSoyadi(studentDoc.getString("soyadi"));
            student.setMezuniyetYili(studentDoc.getInteger("mezuniyetYili"));
            return student;
        }
        return null;
    }
    
    public List<StudentLocations> getAllStudentLocations() {
        MongoCollection<Document> studentCollection = database.getCollection("students");
        MongoCollection<Document> locationCollection = database.getCollection("locations");

        List<StudentLocations> locations = new ArrayList<>();
        FindIterable<Document> locationDocuments = locationCollection.find();

        for (Document locationDoc : locationDocuments) {
            ObjectId studentId = locationDoc.getObjectId("studentId");
            Document studentDoc = studentCollection.find(new Document("_id", studentId)).first();

            if (studentDoc != null) {
                StudentLocations location = new StudentLocations(
                        studentId,
                        locationDoc.getString("city"),
                        locationDoc.getDouble("latitude"),
                        locationDoc.getDouble("longitude")
                );

                locations.add(location);
            }
        }
        return locations;
    }
}


