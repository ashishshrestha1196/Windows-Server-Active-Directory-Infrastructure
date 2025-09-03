# Windows-Server-Active-Directory-Infrastructure
This project demonstrates the design and configuration of a multi-domain Active Directory environment using Windows Server. The setup involves creating two domains, establishing a forest trust relationship, configuring organizational units, users, groups, and applying Group Policy Objects to manage enterprise resources.

## ⚙️ Key Configurations
### 1. Domain Controllers Setup
  * Created two Windows Server 2019 domain controllers:
  * alphacorp-DC – 192.168.1.5 (alphacorp.local)
  * betacorp-DC – 172.22.77.5 (betacorp.local)
Installed Active Directory Domain Services (ADDS).

### 2. Trust Relationship
* Configured DNS Conditional Forwarders for name resolution.
* Created Reverse Lookup Zones for both domains.
* Established a Forest Trust Relationship between the two domains.
* Delegated control so that administrators from one domain could manage users in the other.

### 3. Organizational Units (OUs), Users, and Groups
* Created OUs for: IT, Sales, Executive, Marketing, and HR.
* Added 2 users per department.
* Configured security groups for department-level access control.

### 4. Shared Drives & Storage
* Configured RAID 5 partition with 3x 5 GB drives.
* Created department-specific folders with NTFS permissions.
* Users only see folders relevant to their department.

### 5. Group Policies (GPOs)
#### Drive Mapping:
* Automatically mapped network drives for each department.
* Restricted folder visibility to authorized groups only.

#### Printer Deployment:
* Configured printers via Print Management.
* Deployed printers using GPO (User Config > Preferences > Control Panel > Printers).

#### Browser Policy:
* Set Microsoft Edge as the default browser.
* Configured conestoga.on as the default homepage.

### 6. Cross-Domain Resource Sharing
* Configured shared folder access between alphacorp and betacorp.
* Applied permissions to allow only relevant groups from the other domain.

## 🚀 Skills Demonstrated
- Windows Server 2019 Administration
- Active Directory Domain Services (ADDS)
- DNS & Reverse Lookup Configuration
- Active Directory Trusts & Delegations
- Group Policy Management (Drive Mapping, Printers, Browser Policies)
- Storage Management (RAID 5, NTFS Permissions)
- Enterprise Resource Deployment
