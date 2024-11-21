// tests/pairs.test.ts
import request from 'supertest';
import app from '../src/app';

describe('GET /api/pairs', () => {
  it('should return a list of pairs', async () => {
    const response = await request(app)
      .get('/api/pairs')
      .query({ protocol: 'soroswap', network: 'TESTNET' });

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBeTruthy();
  });

  it('should return error 400 if parameters are missing', async () => {
    const response = await request(app).get('/api/pairs');
    expect(response.status).toBe(400);
  });
});
