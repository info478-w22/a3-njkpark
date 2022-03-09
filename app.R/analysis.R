require(EpiModel)
######## Basic SI model 
#https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0247995
#maximum infection probability for covid 19 is 63.2%
param <- param.dcm(inf.prob = 0.632, act.rate = c(2))
init <- init.dcm(s.num = 999, i.num = 10)
control <- control.dcm(type = "SI", nsteps = 100)


mod <- dcm(param, init, control)
mod
plot(mod)

#### Individual contact models
# Transmission probability, covid 19 carrier and healthy person no mask
param.icm <- param.icm(inf.prob = c(0.9), act.rate = 0.5, rec.rate = 0.01)
init.icm <- init.icm(s.num = 500, i.num = 1, r.num = 0)
control.icm <- control.icm(type = "SIR", nsims = 100, nsteps = 300)
mod.icm <- icm(param.icm, init.icm, control.icm)
plot(mod.icm)
# Transmission probability, covid 19 carrier no mask, healthy person has mask
param.icm1 <- param.icm(inf.prob = c(0.7), act.rate = 0.5, rec.rate = 0.01)
init.icm1 <- init.icm(s.num = 500, i.num = 1, r.num = 0)
control.icm1 <- control.icm(type = "SIR", nsims = 100, nsteps = 300)
mod.icm1 <- icm(param.icm1, init.icm1, control.icm1)
plot(mod.icm1)
#Tranmission probability, covid 19 carrier has mask, healthy person no mask
param.icm2 <- param.icm(inf.prob = c(0.05), act.rate = 0.5, rec.rate = 0.01)
init.icm2 <- init.icm(s.num = 500, i.num = 1, r.num = 0)
control.icm2 <- control.icm(type = "SIR", nsims = 100, nsteps = 300)
mod.icm2 <- icm(param.icm2, init.icm2, control.icm2)
plot(mod.icm2)
#Transmission probability, covid 19 carrier has mask, healthy person has mask
param.icm3 <- param.icm(inf.prob = c(0.015), act.rate = 0.5, rec.rate = 0.01)
init.icm3 <- init.icm(s.num = 500, i.num = 1, r.num = 0)
control.icm3 <- control.icm(type = "SIR", nsims = 100, nsteps = 300)
mod.icm3 <- icm(param.icm3, init.icm3, control.icm3)
plot(mod.icm3)
