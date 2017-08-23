package cn.shiyun.entity;

public class Brand {
	private int BrandId;
	private String BrandCode;
	private String BrandName;
	private String BrandDesc;
	private int BrandSeq;
	private int pBrandId;
	private int Status;
	public int getBrandId() {
		return BrandId;
	}
	public void setBrandId(int brandId) {
		BrandId = brandId;
	}
	public String getBrandCode() {
		return BrandCode;
	}
	public void setBrandCode(String brandCode) {
		BrandCode = brandCode;
	}
	public String getBrandName() {
		return BrandName;
	}
	public void setBrandName(String brandName) {
		BrandName = brandName;
	}
	public String getBrandDesc() {
		return BrandDesc;
	}
	public void setBrandDesc(String brandDesc) {
		BrandDesc = brandDesc;
	}
	public int getBrandSeq() {
		return BrandSeq;
	}
	public void setBrandSeq(int brandSeq) {
		BrandSeq = brandSeq;
	}
	public int getpBrandId() {
		return pBrandId;
	}
	public void setpBrandId(int pBrandId) {
		this.pBrandId = pBrandId;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	
	
	
}
