### **Step 1: Create a New Google Cloud Project**
1. **Go to the GCP Console:**
   1. Navigate to the Google Cloud Console.
1. **Select or Create a New Project:**
   1. In the top-left corner, click on the project selector drop-down.
   1. Click on **New Project**.
   1. Give your project a name (e.g., wazuh-deployment) and select your **Billing Account** (if you already have one).
   1. Optionally, choose a location for the project, then click **Create**.
1. **Enable Billing for the Project:**
   1. After the project is created, navigate to the Billing Page to ensure that billing is enabled for the project.
   1. If prompted, choose the **Free Tier** option, if available.

### **Step 2: Enable the Required APIs**
1. **Enable Compute Engine API:**
   1. In the GCP Console, navigate to the API & Services > Library.
   1. Search for **Compute Engine API**.
   1. Click on it, and then click **Enable**.
1. **Enable Identity and Access Management (IAM) API:**
   1. Similarly, search for **IAM API**.
   1. Click on it, and then click **Enable**.
1. **Enable Cloud Resource Manager API:**
   1. Search for **Cloud Resource Manager API**.
   1. Click on it, and then click **Enable**.

### **Step 3: Create a Service Account**
1. **Navigate to the IAM & Admin Section:**
   1. Go to the IAM & Admin > Service Accounts.
   1. Make sure your newly created project is selected.
1. **Create a New Service Account:**
   1. Click **+ CREATE SERVICE ACCOUNT**.
   1. Give the service account a name (e.g., terraform-sa) and an optional description.
   1. Click **Create and Continue**.



1. **Grant Permissions to the Service Account:**
   1. In the "Grant this service account access to project" step, you’ll need to assign the appropriate roles to allow Terraform to manage resources in your GCP project.
      1. Add the following roles:
         1. **Editor** (provides full access to all resources)
         1. **Viewer** (provides read-only access to resources)
         1. **Service Account User** (allows the service account to act as other service accounts)
   1. Click **Continue**.
1. **Skip the User Permissions:**
   1. Click **Done** after the permissions are assigned (no need to grant users access to this service account).

### **Step 4: Create and Download a Service Account Key**
1. **Select the Newly Created Service Account:**
   1. Find the service account you just created (e.g., terraform-sa) in the list of service accounts.
   1. Click on it.
1. **Create a Key for the Service Account:**
   1. In the service account details page, click the **Keys** tab.
   1. Click **ADD KEY** > **Create new key**.
   1. Choose **JSON** format and click **Create**.
   1. The JSON key file will be automatically downloaded to your computer. This file contains the credentials that Terraform will use to interact with your GCP project.

**Important:** Store this key file securely, as it provides access to your GCP project.

### **Step 5: Use the Service Account Key in Terraform**
Now that you have the service account JSON key, you can configure Terraform to use it:

1. **Move the JSON Key File:**
   1. Place the downloaded JSON key file in a secure directory, for example:

/path/to/your/credentials.json

