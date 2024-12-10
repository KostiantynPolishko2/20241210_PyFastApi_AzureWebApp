from fastapi import FastAPI, status
from fastapi.responses import RedirectResponse
import uvicorn

app = FastAPI()

@app.get('/', response_class=RedirectResponse, include_in_schema=False)
async def docs()->RedirectResponse:
    return RedirectResponse(url='/docs')

@app.get('/{name}', status_code=status.HTTP_200_OK)
async def get_name(name:str)->dict[str, str]:
    return {'username': name}


if __name__ == '__main__':
    uvicorn.run(app)