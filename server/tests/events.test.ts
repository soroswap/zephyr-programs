// import request from 'supertest';
// import app from '../src/app';

// describe('GET /api/events', () => {
//   it('should return a list of events', async () => {
//     const response = await request(app)
//       .get('/api/events')
//       .query({ protocol: 'soroswap', network: 'TESTNET' });

//     expect(response.status).toBe(200);
//     expect(Array.isArray(response.body)).toBeTruthy();
//   });

//   it('should return error 400 if parameters are missing', async () => {
//     const response = await request(app).get('/api/events');
//     expect(response.status).toBe(400);
//   });
// });
