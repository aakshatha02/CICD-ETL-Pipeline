import os
import kaggle

os.environ['KAGGLE_CONFIG_DIR'] = '/Users/akshatha/Desktop/Personal_repo/CICD-ETL-Pipeline/kaggle.json'  # Update the path if needed

#dataset = 'abdulszz/spotify-most-streamed-songs' 
#dataset = 'kzmontage/e-commerce-website-logs/'
dataset= 'sondosaabed/firewall-logs'


try:
    kaggle.api.dataset_download_files(dataset, path='/Users/akshatha/Desktop/Personal_repo/CICD-ETL-Pipeline/data', unzip=True)
    print(f"Dataset '{dataset}' has been successfully downloaded and extracted.")
except Exception as e:
    print(f"Error downloading dataset: {str(e)}")
