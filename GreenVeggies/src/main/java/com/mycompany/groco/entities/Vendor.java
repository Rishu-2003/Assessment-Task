package com.mycompany.groco.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author rishu
 */
@Entity
public class Vendor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int Id;
    @Column(name="Vendor_Name",length=100)
    private String vendorName;
    @Column(name="Email_Id",length=100)
    private String Email;
    @Column(name="UPI_Id",length=50)
    private String upi_Id;
    @Column(name="Aaddhar_No",length=12)
    private String AaddharNo;
    @Column(name="Vendor_Address",length=500)
    private String address;
    @Column(name="Mobile_No",length=10)
    private String mobileNo;

    public Vendor(int Id, String vendorName, String Email, String upi_Id, String AaddharNo, String address, String mobileNo) {
        this.Id = Id;
        this.vendorName = vendorName;
        this.Email = Email;
        this.upi_Id = upi_Id;
        this.AaddharNo = AaddharNo;
        this.address = address;
        this.mobileNo = mobileNo;
    }

    public Vendor(String vendorName, String Email, String upi_Id, String AaddharNo, String address, String mobileNo) {
        this.vendorName = vendorName;
        this.Email = Email;
        this.upi_Id = upi_Id;
        this.AaddharNo = AaddharNo;
        this.address = address;
        this.mobileNo = mobileNo;
    }

    public Vendor() {
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getUpi_Id() {
        return upi_Id;
    }

    public void setUpi_Id(String upi_Id) {
        this.upi_Id = upi_Id;
    }

    public String getAaddharNo() {
        return AaddharNo;
    }

    public void setAaddharNo(String AaddharNo) {
        this.AaddharNo = AaddharNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }
    
    
}
