<?php
class Board extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('board_model');
    }

    public function index()
    {
        $data['postA'] = $this->board_model->get_posts('a');
        $data['postB'] = $this->board_model->get_posts('b');
        $data['postC'] = $this->board_model->get_posts('c');
        
        // $this->load->view('common/header');
        $this->load->helper('url');
        $this->load->view('board/index', $data);
        // $this->load->view('common/footer');
    }

    public function write()
    {
        $this->load->helper('form');
        $this->load->library('form_validation');

        $this->form_validation->set_rules('title', 'Title', 'required');
        $this->form_validation->set_rules('text', 'Text', 'required');
        
        if ($this->form_validation->run() === FALSE)
        {
            $this->load->view('board/write');
        }
        else
        {
            $this->board_model->set_posts();
            $this->load->view('board/success');
        }
    }

    public function view()
    {
        
    }
}