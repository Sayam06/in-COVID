const express = require('express')
const mongoose = require('mongoose')
const bodyParser = require('body-parser')

const app = express()
app.use(bodyParser.urlencoded({ extended: true }))

// GOVT. HOSPITAL CONNECTION

conn1 = mongoose.createConnection(
	{key1},
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
  }
)

// PVT. HOSPITAL CONNECTION

conn2 = mongoose.createConnection(
	{key2},
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
  }
)

// SERVICE CONNECTION

conn3 = mongoose.createConnection(
	{key3},
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
  }
)

// COMPLAINTS CONNECTION

conn4 = mongoose.createConnection(
	{key4},
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false
  }
)

const dataSchema = new mongoose.Schema({
  District: String,
  Name: String,
  Vacant: Number,
  Address: String,
  PhoneNumber: String
})

const pvtSchema = new mongoose.Schema({
  Name: String,
  PhoneNumber: String,
  HospName: String,
  Description: String,
  DateAdded: String,
  TimeAdded: String,
  District: String
})

const serviceSchema = new mongoose.Schema({
  name: String,
  address: String,
  phone: String,
  service: String,
  district: String,
  date: String,
  homeDelivery: String,
  bloodGroup: String,
  dateOfRecovery: String,
  description: String
})

const complaintSchema = new mongoose.Schema({
  Name: String,
  PhoneNumber: String,
  DateAdded: String,
  Description: String
})

// GET REQUEST FOR STATE -> GOVT. HOSPITAL

app.get('/hospital/:state', (req, res) => {
  const State = conn1.model(req.params.state, dataSchema)

  State.find().sort({ Vacant: -1 }).exec((err, foundData) => {
    if (err) {
      console.log(err)
    } else {
      res.send(foundData)
    }
  })
})

// GET REQUEST FOR STATE -> PVT. HOSPITAL

app.get('/private/:state', (req, res) => {
  const State = conn2.model(req.params.state, pvtSchema)

  State.find().sort({ _id: -1 }).exec((err, foundData) => {
    if (err) {
      console.log(err)
    } else {
      res.send(foundData)
    }
  })
})

// POST REQUEST FOR STATE -> PVT. HOSPITAL

app.post('/private/:state', (req, res) => {
  const State = conn2.model(req.params.state, pvtSchema)

  const newData = new State({
    Name: req.body.Name,
    PhoneNumber: req.body.PhoneNumber,
    HospName: req.body.HospName,
    Description: req.body.Description,
    DateAdded: req.body.DateAdded,
    TimeAdded: req.body.TimeAdded,
    District: req.body.District
  })

  newData.save(err => {
    if (err) {
      console.log(err)
    } else {
      res.send('Successfully added new data.')
    }
  })
})

// GET REQUEST FOR STATE -> ALL SERVICE

app.get('/service/:state', function (req, res) {
  const State = conn3.model(req.params.state, serviceSchema)

  State.find().sort({ _id: -1 }).exec((err, foundData) => {
    if (err) {
      console.log(err)
    } else {
      res.send(foundData)
    }
  })
})

// GET REQUEST FOR STATE -> SPECIFIC SERVICE

app.get('/service/:state/:service', function (req, res) {
  const State = conn3.model(req.params.state, serviceSchema)

  State.find({ service: req.params.service })
		.sort({ _id: -1 })
		.exec((err, foundData) => {
  if (err) {
    console.log(err)
  } else {
    res.send(foundData)
  }
})
})

// POST REQUEST FOR STATE -> ALL SERVICE

app.post('/service/:state', function (req, res) {
  const State = conn3.model(req.params.state, serviceSchema)

  const newData = new State({
    name: req.body.name,
    address: req.body.address,
    phone: req.body.phone,
    service: req.body.service,
    district: req.body.district,
    date: req.body.date,
    homeDelivery: req.body.homeDelivery,
    bloodGroup: req.body.bloodGroup,
    dateOfRecovery: req.body.dateOfRecovery,
    description: req.body.description
  })

  newData.save(err => {
    if (err) {
      console.log(err)
    } else {
      res.send('Successfully added new data.')
    }
  })
})

// GET REQUEST FOR COMPLAINTS

app.get('/complaints', (req, res) => {
  const Complaint = conn4.model('complaint', complaintSchema)
  Complaint.find({}, (err, foundData) => {
    if (err) {
      console.log(err)
    } else {
      res.send(foundData)
    }
  })
})

// POST REQUEST FOR COMPLAINTS

app.post('/complaints', (req, res) => {
  const Complaint = conn4.model('complaint', complaintSchema)

  const newComplaint = new Complaint({
    Name: req.body.Name,
    PhoneNumber: req.body.PhoneNumber,
    DateAdded: req.body.DateAdded,
    Description: req.body.Description
  })

  newComplaint.save(err => {
    if (err) {
      console.log(err)
    } else {
      res.send('Successfully added new data.')
    }
  })
})

PORT = process.env.PORT || 3000

app.listen(PORT, () => {
  console.log('Server running.')
})
