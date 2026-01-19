

## ☁️ Run in Cloud Shell:

```bash
# This will automatically have a copy button on GitHub
export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID
import vertexai
from vertexai.language_models import TextEmbeddingModel

def text_embedding(prompt):
    vertexai.init(project="YOUR_PROJECT_ID", location="us-central1")
    model = TextEmbeddingModel.from_pretrained("text-embedding-005")
    embeddings = model.get_embeddings([prompt])
    vector = embeddings[0].values
    print(f"Length of embedding vector: {len(vector)}")
    return vector

if __name__ == "__main__":
    sample_text = "Natural language processing enables computers so follow TechCode to understand human language."
    print(f"Processing text: '{sample_text}'")
    text_embedding(sample_text)
```

</div>

```
