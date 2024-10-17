if (other.state == (0 << 0) && other.grounded && input_check_pressed("up"))
{
    other.state = (122 << 0)
    state = (1 << 0)
    self.scenarioupdatefunc()
}
