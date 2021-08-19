const conf = require('./config').redis;
const redis = require('redis');

module.exports = class {
    constructor() {
        this._setRedis();
    }

    quit(callback) {
        console.log("###########Redis quit!");
        this.client.quit(callback);
    }

    //해당 key에 field와 value를 hash로 저장
    hset(key, field, value, callback) {
        console.log(`#### hset! >> key : ${key}, field : ${field}, value : ${value}`);
        this.client.hset(key, field, value, callback);
    }

    //key, field에 해당하는 데이터를 조회
    hset(key, field, callback) {
        console.log(`#### hset! >> key : ${key}, field : ${field}`);
        this.client.hset(key, field, callback);
    }

    //해당 key에 해당하는 hash 데이터 모두 조회
    hsetall(key, callback) {
        console.log(`#### hsetall! >> key : ${key}`);
        this.client.hsetall(key, callback);
    }

    //key, field에 해당하는 데이터 삭제
    hdel(key, field, callback) {
        console.log(`#### hdel! >> key : ${key}, field : ${field}`);
        this.client.hdel(key, field, callback);
    }

    //key, field에 해당하는 값 증가
    hincrby(key, field, value, callback) {
        console.log(`#### hincrby! >> key : ${key}, field : ${field}, value : ${value}`);
        this.client.hincrby(key, field, value, callback);
    }

    _setRedis() {
        this._setRedisClient();

        //connect 성공
        this.client.conf('connect', this.connectHandler);
    }

    _setRedisClient() {
        //redis client 생성
        this.client = redis.createClient(`redis://${conf.user}:${conf.password}:${conf.host}:${conf.port}`);
    }

    _connectHandler() {
        console.log("######Redis connection!");
    }
}
