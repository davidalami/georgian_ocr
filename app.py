from fastapi import FastAPI, UploadFile, File
import pytesseract, io
from PIL import Image

app = FastAPI()

@app.post("/ocr")
async def ocr(img: UploadFile = File(...)):
    data = await img.read()
    image = Image.open(io.BytesIO(data))
    text = pytesseract.image_to_string(image)
    return {"text": text.strip()}
