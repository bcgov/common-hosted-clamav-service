#!/usr/bin/env node

const NodeClam = require('clamscan');
const ClamScan = new NodeClam().init({
  clamdscan: {
    socket: false,
    host: process.env.CLAMAV_HOST,
    port: process.env.CLAMAV_PORT,
    timeout: 60000,
    localFallback: true,
    path: '/usr/bin/clamdscan',
    configFile: null,
    multiscan: true,
    reloadDb: false,
    active: true,
    bypassTest: false,
  },
  preference: 'clamdscan', // If clamdscan is found and active, it will be used by default
});

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
const result = [];

const runScenario = async (clamscan, filename) => {
  const targets = [10, 100, 200, 300, 500, 700, 900, 1000];

  for (let i = 0; i < targets.length; i++) {
    const target = targets[i];
    console.log(`starting ${filename} - ${target}...`);

    const items = new Array(target).fill(null);
    const output = await Promise.all(items.map(() => clamscan.scanFiles([filename])));

    let pass = 0;
    let fail = 0;
    for (let x = 0; x < output.length; x++) {
      const success = output[x].goodFiles.length === 1;
      if (success) pass += 1;
      else fail += 1;
    }

    result.push({
      filename,
      target,
      pass,
      fail,
    });

    sleep(1000);
  }
};

ClamScan.then(async (clamscan) => {
  try {
    await runScenario(clamscan, '500kb.png');
    await runScenario(clamscan, '1mb.png');
    await runScenario(clamscan, '5mb.png');

    console.log(result);
  } catch (err) {
    console.log(err);
  }
}).catch((err) => {
  console.log(err);
});
