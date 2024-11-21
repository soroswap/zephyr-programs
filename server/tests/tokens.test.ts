import request from 'supertest';
import app from '../src/app';

describe('GET /api/tokens', () => {
  it('should return a list of tokens', async () => {
    const response = await request(app)
      .get('/api/tokens')
      .query({ network: 'TESTNET' });

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBeTruthy();
  });

  it('should return error 400 if parameters are missing', async () => {
    const response = await request(app).get('/api/tokens');
    expect(response.status).toBe(400);
  });
});
