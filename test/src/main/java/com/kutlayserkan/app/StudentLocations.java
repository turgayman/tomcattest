package com.kutlayserkan.app;

import org.bson.types.ObjectId;

public class StudentLocations {
    private ObjectId studentId;  // ObjectId tipinde
    private String city;
    private double latitude;
    private double longitude;

    public StudentLocations(ObjectId studentId, String city, double latitude, double longitude) {
        this.studentId = studentId;
        this.city = city;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    // Getter ve Setter metodları
    public ObjectId getStudentId() {
        return studentId;
    }

    public void setStudentId(ObjectId studentId) {
        this.studentId = studentId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
